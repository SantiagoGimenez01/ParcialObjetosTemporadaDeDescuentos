class Pais{
    const conversion
    const juegos = []
    // Legislacion vigente de juegos para que los menores puedan jugar
    const violencia
    const lenguajeInapropiado
    const tematicaAdulta


    method puedenJugarMenoresA(caracteristicas) = caracteristicas.lenguajeInapropiado() == lenguajeInapropiado
                                                && caracteristicas.violencia() == violencia
                                                && caracteristicas.tematicaAdulta() == tematicaAdulta

    method juegosParaMenores() = juegos.filter({juego => self.puedenJugarMenoresA(juego.caracteristicas())})
    method promedioDeJuegosATP() = self.juegosParaMenores().sum{juego => juego.precio()} * conversion / self.juegosParaMenores().size()
}