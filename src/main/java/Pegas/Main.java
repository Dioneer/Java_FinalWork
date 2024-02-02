package Pegas;

import Pegas.model.Dog;
import Pegas.model.Registry;
import Pegas.model.TypeOfAnimal;

public class Main {
    public static void main(String[] args) {
        Registry registry = new Registry();
        System.out.println(registry.addAnimal("asd", 5, "asd,asd,asd,ad","CAMEL"));
        System.out.println(registry.addAnimal("asd", 5, "asd,asd,asd,ad", "CAMEL"));
        System.out.println(registry.loadRegistry());
        registry.addNewCommands(1, "asd,qwe,qew");
        System.out.println(registry.loadRegistry());
    }
}
