class Ticket < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :dependent => :destroy
  acts_as_taggable_on :tags
   
  validates :titulo,     :presence => true
  validates :contenido,  :presence => true,
                          :length => {:minimum => 5, :maximum =>200}
  #variables constantes
  NUEVO = 0
  ASIGNADO = 1
  CERRADO = 2
  TODOS = '7' #estos los teng que poner asi entre '' porque sino no me funciona, los interpreta mal.
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
 
  #este metodo ponerlo dentro de un helper 
  #def ver_estado
  #  if estado == NUEVO
   #   "Nuevo"
  #  elsif estado == ASIGNADO
  #    "asignado a #{owner}" 
  #  elsif estado == CERRADO
  #    "CERRADO"
  #  end
  #end              
end
