package Pegas.presenter;

public interface Observer {
    void addAnimalToRegistry(String name, int age, String commands, String type);
    void addNewCommandToAnimal(int number, String str);

}
