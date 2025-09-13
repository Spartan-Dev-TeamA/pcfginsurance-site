/*
  # Create quote forms table

  1. New Tables
    - `quote_forms`
      - `id` (uuid, primary key)
      - `name` (text) - Full name from quick quote form
      - `email` (text) - Email address
      - `phone` (text) - Phone number
      - `business_name` (text) - Business name (optional)
      - `insurance_type` (text) - Type of insurance needed
      - `message` (text) - Additional details
      - `tag` (text) - Form source tag
      - `created_at` (timestamp)
      - `updated_at` (timestamp)

  2. Security
    - Enable RLS on `quote_forms` table
    - Add policy for public insert (forms are public)
*/

CREATE TABLE IF NOT EXISTS quote_forms (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text,
  email text,
  phone text,
  business_name text,
  insurance_type text,
  message text,
  tag text DEFAULT 'quick-quote',
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

ALTER TABLE quote_forms ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow public insert on quote_forms"
  ON quote_forms
  FOR INSERT
  TO anon
  WITH CHECK (true);

CREATE POLICY "Allow authenticated read on quote_forms"
  ON quote_forms
  FOR SELECT
  TO authenticated
  USING (true);