package Pegas.view;

import Pegas.presenter.Observer;
import Pegas.presenter.View;

public class AnimalView implements View {

    private Observer observer;
    public void setObserver(Observer observer) {
        this.observer = observer;
    }
    private int num;
    public void showAnimals() {
        if(observer != null) {
            observer.loadList().entrySet().forEach(System.out::println);
        }
    }
    public void addAnimal(String name, int age, String commands, String type) {
        if(observer != null) {
            num = observer.addAnimalToRegistry(name, age, commands, type);
        }
    }
    public void addNewCommand(int number, String str){
        if(observer != null) {
            observer.addNewCommandToAnimal(number,str);
        }
    }
    public void showRegistrationResult() {
        if(num != 0) {
            System.out.println("Your animal registration number is: " + num);
        }else{
            System.out.println("Животных еще нет");
        }
    }
}