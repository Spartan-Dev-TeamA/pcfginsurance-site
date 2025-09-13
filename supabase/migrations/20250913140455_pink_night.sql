/*
  # Create career applications table

  1. New Tables
    - `career_applications`
      - `id` (uuid, primary key)
      - `first_name` (text)
      - `last_name` (text)
      - `email` (text)
      - `phone` (text)
      - `position` (text)
      - `location` (text)
      - `experience` (text)
      - `licenses` (text)
      - `cover_letter` (text)
      - `referral` (text)
      - `consent` (boolean)
      - `tag` (text)
      - `created_at` (timestamp)
      - `updated_at` (timestamp)

  2. Security
    - Enable RLS on `career_applications` table
    - Add policies for public insert and authenticated read
*/

CREATE TABLE IF NOT EXISTS career_applications (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  first_name text,
  last_name text,
  email text,
  phone text,
  position text,
  location text,
  experience text,
  licenses text,
  cover_letter text,
  referral text,
  consent boolean DEFAULT false,
  tag text DEFAULT 'career-application',
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

ALTER TABLE career_applications ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow public insert on career_applications"
  ON career_applications
  FOR INSERT
  TO anon
  WITH CHECK (true);

CREATE POLICY "Allow authenticated read on career_applications"
  ON career_applications
  FOR SELECT
  TO authenticated
  USING (true);