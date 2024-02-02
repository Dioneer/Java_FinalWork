package Pegas.presenter;

public class AnimalPresenter implements Observer {
    private final Model model;
    private final View view;
    public AnimalPresenter(Model model, View view, Observer observer) {
        this.model = model;
        this.view = view;
        view.setObserver(this);
    }

}
