-- Módulos
import Data.Map (Map)
import qualified Data.Map as Map

-- Map é usado para armazenar os identificadores do programa
-- Funções utilizadas: Map.empty, Map.insert, Map.lookup

-- =================================================
-- Tipos de árvore sintática
-- =================================================

-- AST
data Type = TInt | TBool | TVoid
    deriving (Show, Eq)

-- Operadores
data BinOp
    = Add | Sub | Mul | Div | Mod
    | Eq | Neq | Lt | Gt | Le | Ge
    | And | Or
    deriving (Show, Eq)

-- Expressões
data Expr
    = Lit Int
    | BLit Bool
    | Var String
    | BinE BinOp Expr Expr
    | Not Expr
    | Call String [Expr]
    deriving (Show, Eq)

-- Stmt
data Stmt
    = Decl Type String Expr     -- int x = 10;
    | Assign String Expr        -- x = 10 + 20;
    | If Expr Stmt Stmt
    | While Expr Stmt
    | Block [Stmt]
    | Return Expr
    | Print Expr
    | Skip
    deriving (Show, Eq)

data FunDecl = FunDecl
    {
        funName :: String,
        funParams :: [(Type, String)], -- [(TInt, "x"), (TInt,"y")]
        funBody :: Stmt
    } deriving (Show, Eq)