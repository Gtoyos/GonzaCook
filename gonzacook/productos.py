# Define el catálogo de Gonzacook

import os

class Productos:
    def __init__(self,code):
        self.code = code
        self.nombre = None
        self.desc = None
        self.precio = {}
        self.custom = {}
        self.custom_extra = {}
        self.consejos = "Pronto para servir! Consumir preferentemente no más de siete dias tras haber recibido el producto."
        self.ingredientes = None

    def gen(self):
        rootp = "gonzacook/static/media/productos/"+self.code #CORREGIR!?
        self.imgs = [f for f in os.listdir(rootp) if os.path.isfile(os.path.join(rootp, f)) and str(f)!=".gitkeep"]
        
def crearProductos():

    ### GALLETAS AMERICANAS
    gam = Productos("gam")
    gam.nombre = "Cookies Americanas"
    gam.desc = "Las cookies americanas son el dulce perfecto para acompañar una deliciosa merienda o desayuno. Grandes e irregulares, un par de cookies americanas son suficientes para quedar satisfecho. Te invito a probar mi versión clásica de base de vainilla con chips de chocolate o con un topping más atrevido como coco rallado. ¡Espero que lo disfrutéis!"
    gam.precio = {1: 28 , 6: 160, 12:300}
    gam.custom = {"Base":["Chocolate","Vainilla"],"Topping":["Chips chocolate negro","Chips chocolate blanco","Coco rallado"]}
    gam.ingredientes = "Las galletas americanas contienen harina, manteca, azucar, vainilla, polvo de hornear y aceite. Adicionalmente puede incluir cacao y los distintos ingredientes para el topping seleccionado."
    
    ### GALLETAS AVENA
    gav = Productos("gav")
    gav.nombre = "Cookies de Avena"
    gav.desc = "Las cookies de avena son una excelente opción para degustar acompañadas de un buen café o chocolate caliente. Esta receta es ideal no solo para los fanáticos de la avena sino también para aquellos que buscan snacks saludables, ricos y caseros en su dieta. Hechas con harina integral y azúcar rubia, las galletas de avena son una opción más saludable que otras recetas de galletas."
    gav.precio = {1: 24, 6: 130, 12:250}
    gav.custom = {"Topping":["Chips chocolate negro","Cranberries","Pasas de uva","Nueces"]}
    gav.ingredientes = "Las galletas de avena contienen azucar rubia, avena, harina integral, manteca, huevos y sal."
    
    ### GALLETAS MANTECA
    gma = Productos("gma")
    gma.nombre = "Galletitas de Manteca"
    gma.desc = "Hay pocos manjares mejores que unas dulces y suaves galletitas de manteca. Si bien a muchas personas les asusta la palabra manteca, unas ricas galletitas de manteca caseras es una alternativa mucho más saludable que esas que terminás siempre comprando por apuro en el supermercado y que, esas sí, están llenas de aditivos y forman parte de los alimentos restringidos en las guías alimentarias. Hechas con ingredientes frescos, las galletas de manteca son un éxito garantizado para la hora del té o una merienda con amigos."
    gma.precio = {1: 15, 6: 80, 12:150}
    gma.ingredientes = "Las galletas de manteca contienen harina, manteca, azucar, vainilla y polvo de hornear."
    
    ### COOKIES CON DISEÑO
    gdi = Productos("gdi")
    gdi.nombre = "Cookies con Diseño"
    gdi.desc = "Las galletas con diseño son una opción perfecta para tus cumpleaños y eventos. Puedes pedir el tipo y forma de galleta que usted desee. Si desea conocer más de mi propuesta de galletas con diseño, te invito a que me escribas directamente en mis redes sociales."
    
    ## PANES RELLENOS
    pre = Productos("pre")
    pre.nombre = "Panes Rellenos"
    pre.desc = "De textura crocante por arriba, suave por dentro y rebozado con distintas semillas, los panes rellenos son un aperitivo sumamente delicioso para acompañar las comidas o degustar en una merienda o desayuno. Te invito a probar mi versión clásica de jamón y queso u otras variantes más modernas como queso cheddar y panceta.\n Perfecto para una merienda entre 5 personas." 
    pre.precio = {1:420}
    pre.custom = {"Rellenos":["Capresse","Cheddar y panceta","Jamón y queso","Queso y aceitunas","Queso y cebolla","Queso y longaniza"]
                    , "Topping": ["Granos de sal y mix de semillas", "Mix de semillas"]}
    pre.ingredientes = "Las panes rellenos contienen manteca, aceite, levadura, sal, semillas y el relleno a elección."
    pre.consejos = "Precalentar el horno a 180°C y calentar durante 15 minutos. Consumir preferentemente no más de siete dias tras haber recibido el producto."
    
    ### PANES HAMBURGUESA
    pha = Productos("pha")
    pha.nombre = "Panes de hamburguesa"
    pha.desc = "Al cocinar unas buenas hamburguesas o sándwiches, es tan importante el contenido como el pan que lo contiene. Estos panes esponjosos de corteza ligeramente crujiente, son sabrosos y aromáticos, es un excelente pan para vuestras hamburguesas caseras."
    pha.precio = {6:85,12:155}
    pha.custom = {"Topping de semillas":["Sésamo","Chía","Lino","Mix"]}
    pha.ingredientes = "Harina, levadura, aceita, sal, yema de huevo y semillas a elección."
    pha.consejos = "Precalentar el horno a 180°C y calentar durante 15 minutos. Alternativamente, se puede calentar en la tostadora o grill. Consumir preferentemente no más de siete dias tras haber recibido el producto."
    
    ### BROWNIES
    bro = Productos("bro")
    bro.nombre = "Brownies"
    bro.desc = "El brownie perfecto debe sentirse compacto, levemente crocante en la superficie, extremadamente chocolatoso, y si bien es una masa densa, debe sentirse suave al morder. Esta receta de brownies es el postre perfecto para una merienda con amigos o una cena especial.\nLa torta brownie mide aproximadamente 20x30cm, unas 12 porciones de 7x7cm."
    bro.precio = {1:550}
    bro.custom = {"Topping":["Nueces","Almendras","Clásico"]}
    bro.ingredientes = "Chocolate, azúcar, manteca, huevos, harina, sal y frutos secos a elección."
    bro.consejos = "Precalentar el horno a 180°C y calentar durante 15 minutos. Consumir preferentemente no más de siete dias tras haber recibido el producto."

    ### PICADA
    pic = Productos("pic")
    pic.nombre = "Picadas Personalizadas"
    pic.desc = "Ofrecemos picadas personalizadas con una selección variada de quesos y fiambres de primera calidad. Se adaptan a tus gustos y necesidades, ideales para reuniones y celebraciones. Contactanos para más información y armamos la picada perfecta para vos."

    ### PANDULCE
    pdu = Productos("pdu")
    pdu.nombre = "Panes Dulces"
    pdu.desc = "Nuestros panes dulces artesanales vienen en dos versiones: fruta abrillantada o chocolate y nueces. Están cubiertos con un glacé especial de naranja, decorados con frutos secos y una cereza, y son ideales para las fiestas y el comienzo del año. Cada pan dulce es de medio kilo, perfecto para compartir o regalar."
    pdu.precio = {1: 450}
    pdu.ingredientes = "Manteca, harina, azúcar, leche y agua de azhar."
    pdu.consejos = "Consumir  preferentemente no más de siete dias tras haber recibido el producto."
    pdu.custom = {"Relleno":["Fruta abrillantada","Chispas de chocolate"]}
                  
    ### SCONES
    sco = Productos("sco")
    sco.nombre = "Scones de Queso"
    sco.desc = "Estos scones de queso con textura crocante por fuera y esponjosa por dentro son ideales acompañados de té o de tu bebida preferida, y perfectos para compartir."
    sco.precio = {12:350}
    sco.ingredientes = "Harina, sal, leche, manteca, queso y mostaza."
    sco.consejos = "Se recomienda consumir calentitos: precalentar el horno a 180°C y calentar durante 15 minutos. Consumir preferentemente no más de siete dias tras haber recibido el producto."

    ### BUDIN NARANJA
    bun = Productos("bun")
    bun.nombre = "Budín"
    bun.desc = "Con una textura esponjosa y un sabor cítrico, el budín de naranja es un clásico de la repostería. Perfecto para acompañar un té o café.\n El budín pesa entre 750g y 800g y mide aproximadamente 28cm, rinde aproximadamente 12 porciones."
    bun.precio = {1:420}
    bun.custom = {"Sabor":["Naranja","Limón"],"Topping":["Nueces", "Choco"]}
    bun.custom_extra = {"Nueces": 30, "Choco": 30}
    bun.ingredientes = "Aceite, jugo y ralladura de naranja, huevos, azúcar, harina y polvo de hornear."
    bun.consejos = "Consumir preferentemente no más de siete dias tras haber recibido el producto."
    
    ### CARROT CAKE
    cak = Productos("cak")
    cak.nombre = "Carrot Cake"
    cak.desc = "Descubre mi carrot cake con frosting de cheese cream. Una combinación de sabores y texturas que te sorprenderá. Su textura húmeda y suave se complementa con un frosting de cheese cream, que equilibra el dulzor del bizcochuelo con un toque suavemente ácido.\n La torta pesa 1.2kg y tiene 28cm de diámetro, salen unas 12 porciones"
    cak.precio = {1:650}
    cak.custom = {"Topping":["Nueces","Almendras","Clásico"]}
    cak.custom_extra = {"Nueces": 30, "Almendras": 30, "Clásico": 0}
    cak.ingredientes = "Huevos, azúcar, aceite, zanahoria, harina, polvo de hornear, canela, sal y queso crema."
    cak.consejos = "Consumir preferentemente no más de siete dias tras haber recibido el producto."

    ### ALFAJORES DE MAICENA
    alfm = Productos("alfm")
    alfm.nombre = "Alfajores de Maicena"
    alfm.desc = "Los alfajores de maicena son un clásico de la repostería. Dos galletas de maicena rellenas de dulce de leche bordeadas con coco rallado. Un clásico que no puede faltar en una buena merienda.\nLa presentación de 5 unidades viene en un empaque especial de obsequio."
    alfm.precio = {5:120, 6: 110, 12:200}
    alfm.ingredientes = "Harina, maicena, manteca, azúcar, huevos, polvo de hornear, dulce de leche, coco rallado, vainilla y sal."
    alfm.consejos = "Consumir preferentemente no más de siete dias tras haber recibido el producto."

    ### GALLETITAS DE MANTECA CON CARITAS
    gmac = Productos("gmac")
    gmac.nombre = "Galletitas de Manteca con Caritas"
    gmac.desc = "Las galletitas de manteca con caritas son una excelente opción para los más chicos. Con la misma receta de las galletitas de manteca, estas galletitas son decoradas con caritas de chocolate. Perfectas para una merienda o para regalar a los más chicos."
    gmac.precio = {12:150}
    gmac.ingredientes = "Las galletas de manteca contienen harina, manteca, azucar, vainilla y polvo de hornear y chocolate para la decoración."
    gmac.consejos = "Consumir preferentemente no más de siete dias tras haber recibido el producto."
    
    productos = [pdu,pic,gam,gma,gav,gdi,pha,pre,bro,sco,bun,cak,alfm,gmac]
    [p.gen() for p in productos]

    return productos
