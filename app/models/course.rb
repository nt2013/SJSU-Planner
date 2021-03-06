class Course < ApplicationRecord
    has_many :grades,
             dependent: :nullify
    has_and_belongs_to_many :semesters,
                            join_table: :semesters_courses

    has_many :course_prereqs,
             class_name: "CoursePrereq",
             join_table: "course_prereqs",
             foreign_key: "course_id"
    has_many :prereqs,
             through: :course_prereqs

    has_many :course_postreqs,
             class_name: "CoursePrereq",
             join_table: "course_prereqs",
             foreign_key: "prereq_id"
    has_many :postreqs,
             through: :course_postreqs

             validates :name, presence:  true
             validates :number, presence:  true
             validates :credits, presence:  true
             validates :name, length: { minimum: 2 }
             validates :name, length: { maximum: 10 }

  def full_name
    "#{name} #{number}"
  end

end
