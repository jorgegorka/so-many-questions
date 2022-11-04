class MembersController < ApplicationController
    before_action :require_login
    layout 'private'
end