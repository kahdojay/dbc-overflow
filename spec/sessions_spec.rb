require 'spec_helper'

describe SessionsController do
  describe '#login' do
    it 'creates a session upon login with valid credentials'
    it 'redirects a user with invalid credentials to the login page'
    it 'displays an error message for users with invalid credentials'
  end
end
