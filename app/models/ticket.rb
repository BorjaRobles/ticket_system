class Ticket < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :dependent => :destroy
  acts_as_taggable_on :tags
   
  validates :titulo,     :presence => true
  validates :contenido,  :presence => true,
                          :length => {:minimum => 5, :maximum =>200}
  NUEVO = 0
  ASIGNADO = 1
  CERRADO = 2
  TODOS = '7'
  FILTRO = '3'
                          
  def self.buscar_titulo(str)
    return[] if str.blank?
    cond_text = str.split.map{ |w| "titulo LIKE ? "}.join(" OR ")
    cond_values = str.split.map{|w| "%#{w}%"}
    all(:conditions => (str ? [cond_text, *cond_values] : []))
  end
  
  def asignar_estado(stad,name)
    self.estado = stad
    self.owner = name
    self.save
  end
end
