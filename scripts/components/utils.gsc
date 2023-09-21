#using scripts\shared\lui_shared;
#using scripts\shared\hud_util_shared;
#using scripts\shared\util_shared;

#namespace utils;

function LUI_create_text( text, alignment, x, y, width, rgb, alpha = 1 )
{    
    textElement = self OpenLUIMenu( "HudElementText" );
    self SetLuiMenuData( textElement, "alignment", alignment );
    self SetLuiMenuData( textElement, "x", x );
    self SetLuiMenuData( textElement, "y", y );
    self SetLuiMenuData( textElement, "width", width );
    self SetLuiMenuData( textElement, "text", text );

    if( alpha < 1 )
        self SetLuiMenuData( textElement, "alpha", alpha );

    lui::set_color(textElement, rgb);

    return textElement;
}

function LUI_create_rectangle( alignment, x, y, width, height, rgb, shader, alpha = 1 )
{
    boxElement = self OpenLUIMenu( "HudElementImage" );
    self SetLuiMenuData( boxElement, "alignment", alignment );
    self SetLuiMenuData( boxElement, "x", x );
    self SetLuiMenuData( boxElement, "y", y );
    self SetLuiMenuData( boxElement, "width", width );
    self SetLuiMenuData( boxElement, "height", height );
    self SetLuiMenuData( boxElement, "material", shader );

    if( alpha < 1 )
        self SetLuiMenuData( boxElement, "alpha", alpha );

    lui::set_color(boxElement, rgb);

    return boxElement;
}

function change_color(color)
{
    self.pers["menu_color"] = color;
    lui::set_color(self.hud.title, color);
    lui::set_color(self.hud.topbar, color);
    lui::set_color(self.hud.topseparator, color);
    lui::set_color(self.hud.thomasseparator, color);
    lui::set_color(self.hud.thomasbar, color);
    lui::set_color(self.hud.leftbar, color);
    lui::set_color(self.hud.rightbar, color);
    lui::set_color(self.hud.scrollbar, color);
}

function LUI_close_menu(lui)
{
    self closeluimenu(lui);
}

function create_menu(menu, title, parent)
{
    self.menu.title[menu] = title;
    self.menu.parent[menu] = parent;
}

function add_option(menu, index, text, func, input = "", input2 = "")
{
    self.menu.index = index; 
    self.menu.text[menu][self.menu.index] = text;
    self.menu.func[menu][self.menu.index] = func;
    self.menu.input[menu][self.menu.index] = input;
    self.menu.input2[menu][self.menu.index] = input2;
}

function createText(font,fontSize, sorts, text, align, relative, x, y, alpha, color)
{
    uiElement = hud::createFontString(font, fontSize);
    uiElement hud::setPoint(align, relative, x, y);
    uiElement settext(text);
    uiElement.sort = sorts;
    uiElement.hidewheninmenu = true;
    if( isDefined(alpha) )
        uiElement.alpha = alpha;
    if( isDefined(color) )
        uiElement.color = color;
	uiElement.foreground = true;
	uiElement.hidewhendead = false;
	uiElement.hidewheninkillcam = false;
	uiElement.archived = false;
    return uiElement;
}


function createImage(align, relative, x, y, width, height, sort, alpha, shader)
{
    uiElement = newClientHudElem( self );
    uiElement.elemType = "bar";
    uiElement.width = width;
    uiElement.height = height;
    uiElement.xOffset = 0;
    uiElement.yOffset = 0;
    uiElement.hidewheninmenu = true;
    uiElement.children = [];
    uiElement.sort = sort;
    uiElement.alpha = alpha;
    uiElement hud::setParent( level.uiParent );
    uiElement setShader( shader, width , height );
    uiElement.hidden = false;
    uiElement hud::setPoint(align,relative,x,y);
	uiElement.foreground = true;
	uiElement.hidewhendead = false;
	uiElement.hidewheninkillcam = false;
	uiElement.archived = false;
    return uiElement;
}
 
