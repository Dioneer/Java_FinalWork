package Pegas.model;

public abstract class Animals {
    private static int counter;

    {
        ++counter;
    }
    public static int getCounter() {
        return counter;
    }
}
