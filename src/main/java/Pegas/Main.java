package Pegas;

import Pegas.model.Registry;
import Pegas.presenter.AnimalPresenter;
import Pegas.view.AnimalView;

public class Main {
    public static void main(String[] args) {
        Registry registry = new Registry();
        AnimalView animalView = new AnimalView();
        AnimalPresenter animalPresenter = new AnimalPresenter(registry, animalView);
//        registry.addNewCommands(1, "asd,qwe,qew");
//        System.out.println(registry.loadRegistry());
        animalView.addAnimal("asd", 6, "asd,asd,asd,ad","CAMEL");
        animalView.showRegistrationResult();
        animalView.addAnimal("asd", 6, "asd,asd,asd,ad","CAMEL");
        animalView.showRegistrationResult();
        animalView.addAnimal("asd", 6, "asd,asd,asd,ad","CAMEL");
        animalView.showAnimals();
        animalView.showRegistrationResult();
        animalView.addNewCommand(1,"ad,wre,dfg,xv");
        animalView.showAnimals();
    }
}
