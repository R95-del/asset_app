class UserPdf < Prawn::Document
  def initialize(users)
    super()
    @users = users
    header
    text_content
    table_content
  end

  def header
    text "Users List", size: 30, style: :bold
  end

  def text_content
    move_down 20
    text "This PDF contains a list of all users in the system.", size: 15
  end

  def table_content
    move_down 20
    table table_data do
      row(0).font_style = :bold
      self.header = true
      self.row_colors = ['DDDDDD', 'FFFFFF']
    end
  end

  def table_data
    [['Name', 'Email', 'Admin', 'Created At']] +
      @users.map do |user|
        [
          user.name || "N/A",
          user.email,
          user.admin? ? "Yes" : "No",
          user.created_at.strftime("%d-%m-%Y")
        ]
      end
  end
end
