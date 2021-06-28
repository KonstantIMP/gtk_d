module gtk.ShortcutsWindow;

private import gobject.Signals;
private import gtk.Window;
private import gtk.c.functions;
public  import gtk.c.types;
private import std.algorithm;


/**
 * A `GtkShortcutsWindow` shows information about the keyboard shortcuts
 * and gestures of an application.
 * 
 * The shortcuts can be grouped, and you can have multiple sections in this
 * window, corresponding to the major modes of your application.
 * 
 * Additionally, the shortcuts can be filtered by the current view, to avoid
 * showing information that is not relevant in the current application context.
 * 
 * The recommended way to construct a `GtkShortcutsWindow` is with
 * [class@Gtk.Builder], by populating a `GtkShortcutsWindow` with one or
 * more `GtkShortcutsSection` objects, which contain `GtkShortcutsGroups`
 * that in turn contain objects of class `GtkShortcutsShortcut`.
 * 
 * # A simple example:
 * 
 * ![](gedit-shortcuts.png)
 * 
 * This example has as single section. As you can see, the shortcut groups
 * are arranged in columns, and spread across several pages if there are too
 * many to find on a single page.
 * 
 * The .ui file for this example can be found [here](https://gitlab.gnome.org/GNOME/gtk/tree/master/demos/gtk-demo/shortcuts-gedit.ui).
 * 
 * # An example with multiple views:
 * 
 * ![](clocks-shortcuts.png)
 * 
 * This example shows a `GtkShortcutsWindow` that has been configured to show only
 * the shortcuts relevant to the "stopwatch" view.
 * 
 * The .ui file for this example can be found [here](https://gitlab.gnome.org/GNOME/gtk/tree/master/demos/gtk-demo/shortcuts-clocks.ui).
 * 
 * # An example with multiple sections:
 * 
 * ![](builder-shortcuts.png)
 * 
 * This example shows a `GtkShortcutsWindow` with two sections, "Editor Shortcuts"
 * and "Terminal Shortcuts".
 * 
 * The .ui file for this example can be found [here](https://gitlab.gnome.org/GNOME/gtk/tree/master/demos/gtk-demo/shortcuts-builder.ui).
 */
public class ShortcutsWindow : Window
{
	/** the main Gtk struct */
	protected GtkShortcutsWindow* gtkShortcutsWindow;

	/** Get the main Gtk struct */
	public GtkShortcutsWindow* getShortcutsWindowStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkShortcutsWindow;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkShortcutsWindow;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkShortcutsWindow* gtkShortcutsWindow, bool ownedRef = false)
	{
		this.gtkShortcutsWindow = gtkShortcutsWindow;
		super(cast(GtkWindow*)gtkShortcutsWindow, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_shortcuts_window_get_type();
	}

	/**
	 * Emitted when the user uses a keybinding to close the window.
	 *
	 * This is a [keybinding signal](class.SignalAction.html).
	 *
	 * The default binding for this signal is the Escape key.
	 */
	gulong addOnClose(void delegate(ShortcutsWindow) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "close", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * Emitted when the user uses a keybinding to start a search.
	 *
	 * This is a [keybinding signal](class.SignalAction.html).
	 *
	 * The default binding for this signal is Control-F.
	 */
	gulong addOnSearch(void delegate(ShortcutsWindow) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "search", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
