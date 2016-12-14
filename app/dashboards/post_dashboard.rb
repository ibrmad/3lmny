require "administrate/base_dashboard"

class PostDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    votes_for: Field::HasMany.with_options(class_name: "ActsAsVotable::Vote"),
    user: Field::BelongsTo,
    course: Field::BelongsTo,
    comments: Field::HasMany,
    id: Field::Number,
    title: Field::String,
    content: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :votes_for,
    :user,
    :course,
    :comments,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :votes_for,
    :user,
    :course,
    :comments,
    :id,
    :title,
    :content,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :votes_for,
    :user,
    :course,
    :comments,
    :title,
    :content,
  ].freeze

  # Overwrite this method to customize how posts are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(post)
  #   "Post ##{post.id}"
  # end
end
