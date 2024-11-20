object sinDescuento{

    method aplicar(precio) = precio
}

class DescuentoDirecto{
    const porcentaje

    method aplicar(precio) = precio * (1 + porcentaje/100)
}

class DescuentoFijo{
    const descuento

    method aplicar(precio) = (precio - descuento).max(precio/2)
}

object gratis{

    method aplicar(precio) = 0
}

class DescuentoIndirecto inherits DescuentoDirecto{

    override method aplicar(precio) = super(precio) / 2
}