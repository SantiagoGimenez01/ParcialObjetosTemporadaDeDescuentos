class Critico{

    method esPositiva(juego)
    method criticar(juego){
        juego.agregarCritica(self)
    }
}

class Usuario inherits Critico{
    var property contenido = "SI"

    override method esPositiva(juego) = contenido == "SI"
}


class CriticoPago inherits Critico{
    const juegosQuePagaron = []
    var property contenido = "elkvmlfdkvml"

    override method esPositiva(juego) = juegosQuePagaron.contains(juego)
}

class Revista inherits Critico{
    const criticos = []
 
    method contenido() = criticos.sum({criticos => criticos.contenido()})
    method mayoria() = criticos/2.roundUp()
    override method esPositiva(juego) = criticos.count({critico => critico.esPositiva()}) >= self.mayoria()
}
