package Pegas;

import Pegas.model.Dog;
import Pegas.model.Registry;
import Pegas.model.TypeOfAnimal;

public class Main {
    public static void main(String[] args) {
        Registry registry = new Registry();
        registry.addAnimal("asd", 5, "asd,asd,asd,ad", TypeOfAnimal.valueOf("CAT"));
        System.out.println(registry.loadRegistry());
    }
}
