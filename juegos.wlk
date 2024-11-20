import descuentos.*
object steam{
  const juegos = []
  var property porcentajeEspecial = 50
  
  method elMasCaro() = juegos.max({juego => juego.precioOriginal()})
  method juegosSeleccionados() = juegos.filter({juego => juego.seAcercaA(self.elMasCaro())})
  method aplicarDescuento(){
    const descuentoEspecial = new DescuentoDirecto(porcentaje = porcentajeEspecial)
    if(porcentajeEspecial > 100)
      throw new DomainException(message="Porcentaje especial invalido")
    self.juegosSeleccionados().forEach({juego => juego.cambiarDescuento(descuentoEspecial)})
  }
}

class Juego{
  const property precioOriginal
  var descuento
  const property caracteristicas
  const criticas =[]

  method precio() = descuento.aplicar(precioOriginal)
  method cambiarDescuento(otro){
    descuento = otro
  }
  method seAcercaA(juegoMasCaro) = precioOriginal > juegoMasCaro.precioOriginal() * 0.75
  method esAptoParaMenoresEn(pais) = pais.puedenJugarMenoresA(caracteristicas)
  method recibirCritica(critica){ critica.criticar(self) }
  method agregarCritica(critica){
    criticas.add(critica)
  }
  method pasaUmbralDe(cantidad) = criticas.count({critica => critica.esPositiva(self)}) > cantidad
  method galardoneadoPorEstim() = criticas.all({critica => critica.esPositiva(self)})
  method tieneCriticosLiterarios() = criticas.any({critica => critica.contenido().size() > 100})
}

class Caracteristicas{
  const property lenguajeInapropiado = false
  const property violencia = false 
  const property tematicaAdulta = false 
}