

class ValidStr a where
    isNameValid :: a -> Bool
    
data Name50 = Name50 String | Unk
    deriving (Show)
    
instance ValidStr Name50 where
    isNameValid (Name50 a) = length a <= 50

data Person = Person { firstName :: Name50, lastName :: Name50 }
    deriving (Show)

bob :: Person
bob = Person { firstName = Name50 "Matt", lastName = Name50 "Bob" }

validateName :: Person -> Bool
validateName = isNameValid . firstName

main = 
    putStrLn $ show $ validateName bob

