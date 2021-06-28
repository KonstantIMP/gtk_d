import gtk.Application, gtk.ApplicationWindow, gtk.Label;

int main(string [] args) {
	auto hello_world_app = new Application("org.hello.world.kimp", GApplicationFlags.FLAGS_NONE);

	hello_world_app.addOnActivate((app) {
		auto hello_world_win = new ApplicationWindow(hello_world_app);

		hello_world_win.setTitle("Example 1. Gtk");
		hello_world_win.setChild(new Label("Hello, World!"));
		hello_world_win.setDefaultSize(300, 150);

		hello_world_win.show();
	});

	return hello_world_app.run(args);
}
