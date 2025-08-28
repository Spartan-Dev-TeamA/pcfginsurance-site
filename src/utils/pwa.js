// PWA Utility Functions

/**
 * Shows a toast notification
 * @param {string} message - The message to display
 * @param {string} type - The type of toast (success, error, info)
 */
export function showToast(message, type = 'info') {
  const toastContainer = document.getElementById('toast-container');
  if (!toastContainer) return;
  
  const toast = document.createElement('div');
  toast.className = 'toast';
  
  let iconSvg = '';
  let bgColor = '';
  
  switch (type) {
    case 'success':
      iconSvg = '<svg class="w-5 h-5 text-primary mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>';
      bgColor = 'border-l-4 border-primary';
      break;
    case 'error':
      iconSvg = '<svg class="w-5 h-5 text-red-600 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path></svg>';
      bgColor = 'border-l-4 border-red-600';
      break;
    default:
      iconSvg = '<svg class="w-5 h-5 text-blue-600 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>';
      bgColor = 'border-l-4 border-blue-600';
  }
  
  toast.innerHTML = `
    <div class="flex items-center ${bgColor}">
      ${iconSvg}
      <span class="text-sm font-medium text-neutral-dark">${message}</span>
    </div>
  `;
  
  toastContainer.appendChild(toast);
  
  // Trigger animation
  setTimeout(() => {
    toast.classList.add('show');
  }, 10);
  
  // Remove toast after 3 seconds
  setTimeout(() => {
    toast.classList.remove('show');
    setTimeout(() => {
      toastContainer.removeChild(toast);
    }, 300);
  }, 3000);
}

/**
 * Checks if the app is running in standalone mode (installed PWA)
 * @returns {boolean} - True if running as installed PWA
 */
export function isInstalledPwa() {
  return window.matchMedia('(display-mode: standalone)').matches || 
         window.navigator.standalone === true;
}

/**
 * Detects the user's device type
 * @returns {string} - 'ios', 'android', or 'other'
 */
export function getDeviceType() {
  const userAgent = navigator.userAgent || navigator.vendor || window.opera;
  
  if (/iPad|iPhone|iPod/.test(userAgent) && !window.MSStream) {
    return 'ios';
  }
  
  if (/android/i.test(userAgent)) {
    return 'android';
  }
  
  return 'other';
}

/**
 * Shows the Add to Home Screen prompt
 */
export function showAddToHomeScreenPrompt() {
  const addToHomeScreen = document.getElementById('add-to-homescreen');
  if (addToHomeScreen && !localStorage.getItem('pwaPromptDismissed')) {
    addToHomeScreen.classList.remove('hidden');
  }
}

/**
 * Dismisses the Add to Home Screen prompt
 * @param {number} days - Number of days to dismiss the prompt for
 */
export function dismissAddToHomeScreenPrompt(days = 7) {
  const addToHomeScreen = document.getElementById('add-to-homescreen');
  if (addToHomeScreen) {
    addToHomeScreen.classList.add('hidden');
    localStorage.setItem('pwaPromptDismissed', 'true');
    
    // Reset after specified days
    setTimeout(() => {
      localStorage.removeItem('pwaPromptDismissed');
    }, days * 24 * 60 * 60 * 1000);
  }
}

// Export functions to window for global access
if (typeof window !== 'undefined') {
  window.pwa = {
    showToast,
    isInstalledPwa,
    getDeviceType,
    showAddToHomeScreenPrompt,
    dismissAddToHomeScreenPrompt
  };
}