class Usuario{
    var property contenido = "SI"
    
    method criticar(juego){
        juego.agregarCritica(self)
    }
    method esPositiva(juego) = contenido == "Si"
}


class CriticoPago{
    const juegosQuePagaron = []
    var property contenido = "elkvmlfdkvml"

    method criticar(juego){
        juego.agregarCritica(self)
    }
    method esPositiva(juego) = juegosQuePagaron.contains(juego)
}

class Revista{
    const criticos = []
 
    method contenido() = criticos.sum({criticos => criticos.contenido()})
    method mayoria() = criticos/2.roundUp()
    method esPositiva(juego) = criticos.count({critico => critico.esPositiva()}) >= self.mayoria()
}
