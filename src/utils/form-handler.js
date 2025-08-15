// Enhanced form handling for both Netlify and Supabase
import { submitToSupabase } from './supabase.js';
import { setupNetlifyForm } from './netlify-forms.js';

/**
 * Initialize all forms on the page with enhanced handling
 */
export function initializeForms() {
  // Quick Quote Form
  setupNetlifyForm('quote-form', 'quick_quote_form', {
    successMessage: 'Thank you for your interest! We will contact you within 24 hours.',
    onSubmit: (e) => {
      console.log('Quick quote form submitted');
    }
  });
  
  // Contact Form
  setupNetlifyForm('contact-form', 'contact_form', {
    successMessage: 'Thank you for contacting us! We will get back to you within 24 hours.',
    onSubmit: (e) => {
      console.log('Contact form submitted');
    }
  });
  
  // Commercial Auto Form
  setupNetlifyForm('commercial-auto-form', 'commercial_auto_lead', {
    successMessage: 'Thank you for your interest! We will contact you within 24 hours with your commercial auto quote.',
    onSubmit: (e) => {
      console.log('Commercial auto form submitted');
    }
  });
  
  // Workers Comp Form
  setupNetlifyForm('workers-comp-form', 'workers_comp_lead', {
    successMessage: 'Thank you for your interest! We will contact you within 24 hours with your workers\' compensation quote.',
    onSubmit: (e) => {
      console.log('Workers comp form submitted');
    }
  });
  
  // General Liability Form
  setupNetlifyForm('general-liability-form', 'general_liability_lead', {
    successMessage: 'Thank you for your interest! We will contact you within 24 hours with your general liability quote.',
    onSubmit: (e) => {
      console.log('General liability form submitted');
    }
  });
  
  // BOP Form
  setupNetlifyForm('bop-form', 'bop_lead', {
    successMessage: 'Thank you for your interest! We will contact you within 24 hours with your Business Owner\'s Policy quote.',
    onSubmit: (e) => {
      console.log('BOP form submitted');
    }
  });
  
  // Personal Lines Quote Form
  setupNetlifyForm('personal-lines-quote-form', 'personal_lines_quote', {
    successMessage: 'Thank you for your information! We will contact you within 24 hours with your personalized quote.',
    onSubmit: (e) => {
      console.log('Personal lines quote form submitted');
    }
  });
  
  // Claim Report Form
  setupNetlifyForm('claim-report-form', 'claim_report', {
    successMessage: 'Claim report submitted successfully! We will assign an adjuster and contact you within 24 hours.',
    onSubmit: (e) => {
      console.log('Claim report submitted');
    }
  });
  
  // Career Application Form
  setupNetlifyForm('career-application-form', 'career_application', {
    successMessage: 'Thank you for your application! We will review your information and contact you if there is a match.',
    onSubmit: (e) => {
      console.log('Career application submitted');
    }
  });
}

// Auto-initialize when DOM is loaded
if (typeof document !== 'undefined') {
  document.addEventListener('DOMContentLoaded', initializeForms);
}

// Make available globally
if (typeof window !== 'undefined') {
  window.initializeForms = initializeForms;
}