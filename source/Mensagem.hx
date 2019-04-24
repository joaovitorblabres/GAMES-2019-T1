package;

//import flixel.*;

class Mensagem {
    public static inline var OP_DANO:Int = 0;
    public static inline var OP_CURA:Int = 1;

    public var from:Entidade;
    public var to:Entidade;
    public var op:Int;
    public var data:Float;

    public function new(){}
}