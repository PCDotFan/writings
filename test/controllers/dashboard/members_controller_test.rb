require 'test_helper'

class Dashboard::MembersControllerTest < ActionController::TestCase
  def setup
    @space = create :space, :plan => Enum::Plan::BASE, :plan_expired_at => 1.day.from_now
    @space.add_creator(create :user)
    login_as @space.creator
  end

  test "should get workspace members" do
    get :index, :space_id => @space
    assert_response :success, @response.body
  end

  test "should destroy member" do
    member = create :user
    @space.members << member
    assert_difference "@space.reload.members.count", -1 do
      delete :destroy, :space_id => @space, :id => member, :format => :js
    end
  end

  test "shuold not destroy if in plan free" do
    @space.update_attribute :plan, Enum::Plan::FREE
    member = create :user
    @space.members << member
    assert_no_difference "@space.reload.members.count", -1 do
      delete :destroy, :space_id => @space, :id => member, :format => :js
    end
  end
end
