# Contributing to PCFG Insurance Services Website

We welcome contributions to improve the PCFG Insurance Services website. This document provides guidelines for contributing to the project.

## Getting Started

### Prerequisites
- Node.js 18 or higher
- npm or yarn package manager
- Git
- Basic knowledge of Astro, HTML, CSS, and JavaScript

### Development Setup
1. Fork the repository on GitHub
2. Clone your fork locally:
   ```bash
   git clone https://github.com/yourusername/pcfg-insurance-services.git
   cd pcfg-insurance-services
   ```
3. Install dependencies:
   ```bash
   npm install
   ```
4. Copy environment variables:
   ```bash
   cp .env.example .env
   # Edit .env with your actual values
   ```
5. Start development server:
   ```bash
   npm run dev
   ```

## Development Workflow

### Local Development
```bash
# Clone the repository
git clone <your-repo-url>
cd pcfg-insurance-services

# If this is part of a monorepo, navigate to the project directory
# cd path/to/insurance-project

# Install dependencies
npm install
```

## Development Guidelines

### Code Style
- Use consistent indentation (2 spaces)
- Follow existing naming conventions
- Write clear, descriptive variable and function names
- Add comments for complex logic
- Keep functions small and focused

### File Organization
- Components in `src/components/`
- Pages in `src/pages/`
- Utilities in `src/utils/`
- Styles follow Tailwind CSS conventions
- Assets in `public/`

### Form Development
- All forms must include Netlify attributes
- Add proper validation and error handling
- Include reCAPTCHA for spam protection
- Test form submissions thoroughly
- Update netlify.toml when adding new forms

### Responsive Design
- Mobile-first approach
- Test on multiple screen sizes
- Use Tailwind responsive utilities
- Ensure touch-friendly interface elements
- Optimize for performance

## Testing

### Local Testing
```bash
# Start development server
npm run dev

# Build for production
npm run build

# Preview production build
npm run preview
```

### Testing Checklist
- [ ] All forms submit successfully
- [ ] Responsive design works on mobile/tablet/desktop
- [ ] No console errors or warnings
- [ ] Images load correctly
- [ ] Navigation works properly
- [ ] Performance is acceptable
- [ ] Accessibility standards met

## Submitting Changes

### Pull Request Process
1. Create a feature branch:
   ```bash
   git checkout -b feature/your-feature-name
   ```
2. Make your changes
3. Test thoroughly
4. Commit with descriptive messages:
   ```bash
   git commit -m "Add: Brief description of changes"
   ```
5. Push to your fork:
   ```bash
   git push origin feature/your-feature-name
   ```
6. Create a pull request on GitHub
7. Fill out the PR template completely
8. Wait for review and address feedback

### Commit Message Convention
- `Add:` for new features
- `Fix:` for bug fixes
- `Update:` for modifications to existing features
- `Remove:` for deletions
- `Docs:` for documentation changes
- `Style:` for formatting changes
- `Refactor:` for code refactoring
- `Test:` for test-related changes

## Content Guidelines

### Insurance Content
- Ensure accuracy of insurance information
- Use clear, non-technical language
- Include proper disclaimers
- Verify state licensing requirements
- Follow industry compliance standards

### SEO and Accessibility
- Include proper meta descriptions
- Use semantic HTML elements
- Add alt text for images
- Ensure keyboard navigation
- Maintain good contrast ratios
- Test with screen readers

### Brand Guidelines
- Use approved colors and fonts
- Maintain consistent tone and voice
- Include proper PCFG branding
- Follow professional standards
- Ensure veteran-owned messaging is appropriate

## Form Contributions

### Adding New Forms
1. Create form component in `src/components/`
2. Add form configuration to `netlify.toml`
3. Include proper validation
4. Add Supabase integration if needed
5. Test form submission thoroughly
6. Update documentation

### Form Requirements
- Include `data-netlify="true"`
- Add `name` attribute for identification
- Include hidden `form-name` field
- Add reCAPTCHA protection
- Implement proper error handling
- Include success/error messages

## Security

### Security Considerations
- Never commit sensitive data
- Use environment variables for secrets
- Validate all user inputs
- Implement proper access controls
- Follow OWASP security guidelines
- Report security issues privately

### Reporting Security Issues
Email security issues to: security@pcfginsurance.com
Do not create public issues for security vulnerabilities.

## Support

### Getting Help
- Check existing issues on GitHub
- Review documentation thoroughly
- Ask questions in pull request comments
- Contact the development team

### Contact Information
- **General**: info@pcfginsurance.com
- **Technical**: technical@pcfginsurance.com
- **Security**: security@pcfginsurance.com

## License

By contributing to this project, you agree that your contributions will be licensed under the same license as the project.

## Recognition

Contributors will be recognized in the project documentation and release notes. Thank you for helping improve the PCFG Insurance Services website!