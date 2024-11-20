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

  method precio() = descuento.aplicar(precioOriginal)
  method cambiarDescuento(otro){
    descuento = otro
  }
  method seAcercaA(juegoMasCaro) = precioOriginal > juegoMasCaro.precioOriginal() * 0.75
}