require 'test_helper'

class ParticipantManagementsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get participant_managements_create_url
    assert_response :success
  end

  test "should get destroy" do
    get participant_managements_destroy_url
    assert_response :success
  end

end
