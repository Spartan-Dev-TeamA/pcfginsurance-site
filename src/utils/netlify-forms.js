// Netlify Forms Utility Functions

/**
 * Enhanced form submission handler that works with both Netlify and Supabase
 * @param {HTMLFormElement} form - The form element
 * @param {string} formType - The type of form for Supabase submission
 * @param {Function} onSuccess - Success callback function
 * @param {Function} onError - Error callback function
 */
export async function handleFormSubmission(form, formType, onSuccess, onError) {
  try {
    const formData = new FormData(form);
    
    // Check if this is a Netlify-enabled form
    const isNetlifyForm = form.hasAttribute('data-netlify');
    
    if (isNetlifyForm) {
      // Let Netlify handle the form submission naturally
      // The form will submit to Netlify's form handler
      console.log('Form configured for Netlify processing');
      
      // Also submit to Supabase if available
      if (window.submitToSupabase && formType) {
        try {
          const data = Object.fromEntries(formData);
          await window.submitToSupabase(data, formType);
          console.log('Also submitted to Supabase for backup/analytics');
        } catch (supabaseError) {
          console.warn('Supabase submission failed, but Netlify will handle the form:', supabaseError);
        }
      }
      
      // Call success callback
      if (onSuccess) {
        onSuccess();
      }
    } else {
      // Fallback to Supabase-only submission
      if (window.submitToSupabase && formType) {
        const data = Object.fromEntries(formData);
        await window.submitToSupabase(data, formType);
        
        if (onSuccess) {
          onSuccess();
        }
      } else {
        throw new Error('No form submission method available');
      }
    }
  } catch (error) {
    console.error('Form submission error:', error);
    if (onError) {
      onError(error);
    }
  }
}

/**
 * Setup Netlify form handling for enhanced user experience
 * @param {string} formId - The ID of the form element
 * @param {string} formType - The type of form for Supabase submission
 * @param {Object} options - Additional options
 */
export function setupNetlifyForm(formId, formType, options = {}) {
  const form = document.getElementById(formId);
  if (!form) return;
  
  const {
    successMessage = 'Form submitted successfully! We will contact you soon.',
    errorMessage = 'There was an error submitting your form. Please try again.',
    redirectUrl = null,
    onSubmit = null,
    onSuccess = null,
    onError = null
  } = options;
  
  form.addEventListener('submit', async function(e) {
    // For Netlify forms, we don't prevent default to allow natural submission
    const isNetlifyForm = form.hasAttribute('data-netlify');
    
    if (!isNetlifyForm) {
      e.preventDefault();
    }
    
    // Call custom onSubmit handler if provided
    if (onSubmit) {
      onSubmit(e);
    }
    
    try {
      await handleFormSubmission(
        form, 
        formType,
        () => {
          // Success handler
          if (onSuccess) {
            onSuccess();
          } else if (redirectUrl) {
            window.location.href = redirectUrl;
          } else if (!isNetlifyForm) {
            // Only show alert for non-Netlify forms (Netlify will handle success page)
            alert(successMessage);
            form.reset();
          }
        },
        (error) => {
          // Error handler
          if (onError) {
            onError(error);
          } else {
            alert(errorMessage);
          }
        }
      );
    } catch (error) {
      console.error('Form submission failed:', error);
      if (!isNetlifyForm) {
        alert(errorMessage);
      }
    }
  });
}

/**
 * Add Netlify form attributes to an existing form
 * @param {HTMLFormElement} form - The form element
 * @param {string} formName - The name for the Netlify form
 * @param {boolean} enableRecaptcha - Whether to enable reCAPTCHA
 */
export function enableNetlifyProcessing(form, formName, enableRecaptcha = true) {
  if (!form) return;
  
  // Add Netlify attributes
  form.setAttribute('data-netlify', 'true');
  form.setAttribute('name', formName);
  
  if (enableRecaptcha) {
    form.setAttribute('data-netlify-recaptcha', 'true');
  }
  
  // Add hidden form-name input if it doesn't exist
  if (!form.querySelector('input[name="form-name"]')) {
    const hiddenInput = document.createElement('input');
    hiddenInput.type = 'hidden';
    hiddenInput.name = 'form-name';
    hiddenInput.value = formName;
    form.insertBefore(hiddenInput, form.firstChild);
  }
  
  // Add reCAPTCHA div if enabled and doesn't exist
  if (enableRecaptcha && !form.querySelector('[data-netlify-recaptcha="true"]')) {
    const recaptchaDiv = document.createElement('div');
    recaptchaDiv.setAttribute('data-netlify-recaptcha', 'true');
    
    // Insert before the submit button
    const submitButton = form.querySelector('button[type="submit"]');
    if (submitButton) {
      submitButton.parentNode.insertBefore(recaptchaDiv, submitButton);
    } else {
      form.appendChild(recaptchaDiv);
    }
  }
  
  console.log(`Netlify form processing enabled for: ${formName}`);
}

// Make functions available globally
if (typeof window !== 'undefined') {
  window.netlifyForms = {
    handleFormSubmission,
    setupNetlifyForm,
    enableNetlifyProcessing
  };
}