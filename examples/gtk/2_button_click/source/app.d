import gtk.Application, gtk.ApplicationWindow, gtk.Button, gtk.Revealer, gtk.Label, gtk.Box;

int main(string [] args) {
	auto button_click_app = new Application("org.button.klick.kimp", GApplicationFlags.FLAGS_NONE);

	button_click_app.addOnActivate((app) {
		auto button_click_win = new ApplicationWindow(button_click_app);
		button_click_win.setTitle("Example 2. Gtk");

		auto label_revealer = new Revealer();
		label_revealer.setChild(new Label("Good morning!"));
		label_revealer.setTransitionDuration(750);
		label_revealer.setTransitionType(GtkRevealerTransitionType.CROSSFADE);

		auto show_btn = new Button("Show the message");

		auto main_box = new Box(GtkOrientation.VERTICAL, 5);

		main_box.append(show_btn);
		main_box.append(label_revealer);

		show_btn.addOnClicked((btn) {
			if(label_revealer.getChildRevealed()) {
				label_revealer.setRevealChild(false);
				show_btn.setLabel("Show the message");
			} else {
				label_revealer.setRevealChild(true);
				show_btn.setLabel("Hide the message");
			}
		});

		button_click_win.setChild(main_box);

		button_click_win.show();
	});

	return button_click_app.run(args);
}
