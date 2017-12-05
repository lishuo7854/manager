class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessor :password,:password_conformation
  has_many :articlecomment,:class_name=>'Articlecomment',:foreign_key=>'user_id'
  has_many :article,:class_name=>'Article',:foreign_key=>'user_id'



  validates :email,uniqueness:{message:'账号已经被注册'}, if: :need_validate_password




    private
  def need_validate_password
    self.new_record? ||
      (!self.password.nil? || !self.password_confirmation.nil?)
  end
end
