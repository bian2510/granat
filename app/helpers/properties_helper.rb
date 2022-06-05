module PropertiesHelper
  def price_formated(property)
    "#{number_with_precision(property.price, :precision => 0, :delimiter => ',')} #{property.currency.upcase}"
  end

  # Enums
  
  def neighboords    
    {
       caba: [
         ['Agronomía', 'agronomia'],
         ['Almagro', 'almagro'],
         ['Balvanera', 'balvanera'],
         ['Barracas', 'barracas'],
         ['Belgrano', 'belgrano'],
         ['Boedo', 'boedo'],
         ['Caballito', 'caballito'],
         ['Chacarita', 'chacarita'],
         ['Coghlan', 'coghlan'],
         ['Colegiales', 'colegiales'],
         ['Constitución', 'constitucion'],
         ['Flores', 'flores'],
         ['Floresta', 'floresta'],
         ['La Boca', 'la boca'],
         ['La Paternal', 'la paternal'],
         ['Liniers', 'liniers'],
         ['Mataderos', 'mataderos'],
         ['Monte Castro', 'monte castro'],
         ['Montserrat', 'montserrat'],
         ['Nueva Pompeya', 'nueva pompeya'],
         ['Nuñez', 'nuñez'],
         ['Palermo', 'palermo'],
         ['Parque Avellaneda', 'parque avellaneda'],
         ['Parque Chacabuco', 'parque chacabuco'],
         ['Parque Chas', 'parque chas'],
         ['Parque Patricios', 'parque patricios'],
         ['Puerto Madero', 'puerto madero'],
         ['Recoleta', 'recoleta'],
         ['Retiro', 'retiro'],
         ['Saavedra', 'saavedra'],
         ['San Cristóbal', 'san cristobal'],
         ['San Nicolás', 'san nicolas'],
         ['San Telmo', 'san telmo'],
         ['Versalles', 'versalles'],
         ['Villa Crespo', 'villa crespo'],
         ['Villa Devoto', 'villa devoto'],
         ['Villa General Mitre', 'villa general mitre'],
         ['Villa Lugano', 'villa lugano'],
         ['Villa Luro', 'villa luro'],
         ['Villa Ortúzar', 'villa ortuzar'],
         ['Villa Pueyrredón', 'villa pueyrredón'],
         ['Villa Real', 'villa Real'],
         ['Villa Riachuelo', 'villa riachuelo'],
         ['Villa Santa Rita', 'villa santa rita'],
         ['Villa Soldati', 'villa soldati'],
         ['Villa Urquiza', 'villa urquiza'],
         ['Villa del Parque', 'villa del parque'],
         ['Vélez Sarsfield', 'velez sarsfield']
       ]
     }
   end
 
   def provinces
     [
         ['Buenos Aires', 'buenos aires'],
         ['Caba', 'caba'],
         ['Catamarca', 'catamarca'],
         ['Chaco', 'chaco'],
         ['Chubut', 'chubut'],
         ['Córdoba', 'córdoba'],
         ['Corrientes', 'corrientes'],
         ['Entre Ríos', 'entre rios'],
         ['Formosa', 'formosa'],
         ['Jujuy', 'jujuy'],
         ['La Pampa', 'la pampa'],
         ['La Rioja', 'la rioja'],
         ['Mendoza', 'mendoza'],
         ['Misiones', 'misiones'],
         ['Neuquén', 'neuquen'],
         ['Río Negro', 'rio negro'],
         ['Salta', 'salta'],
         ['San Juan', 'san Juan'],
         ['San Luis', 'san Luis'],
         ['Santa Cruz', 'santa Cruz'],
         ['Santa Fe', 'santa Fe'],
         ['Santiago del Estero', 'santiago del estero'],
         ['Tierra del Fuego, Antártida e Islas del Atlántico Sur', 'tierra del fuego, antártida e islas del atlantico sur'],
         ['Tucumán', 'tucuman']
     ]
   end
 
   def operations
     [
       ['Compra', 'venta'],
       ['Alquiler', 'alquiler']
     ]
   end
 
   def kind
     [
       ['Casa', 'casa'], 
       ['Apartamento', 'apartamento'],
       ['Local', 'Local']
       ]
   end
end
