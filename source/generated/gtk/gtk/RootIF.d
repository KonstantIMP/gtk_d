module gtk.RootIF;

private import gdk.Display;
private import gobject.ObjectG;
private import gtk.Widget;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * `GtkRoot` is the interface implemented by all widgets that can act as a toplevel
 * widget.
 * 
 * The root widget takes care of providing the connection to the windowing system
 * and manages layout, drawing and event delivery for its widget hierarchy.
 * 
 * The obvious example of a `GtkRoot` is `GtkWindow`.
 * 
 * To get the display to which a `GtkRoot` belongs, use
 * [method@Gtk.Root.get_display].
 * 
 * `GtkRoot` also maintains the location of keyboard focus inside its widget
 * hierarchy, with [method@Gtk.Root.set_focus] and [method@Gtk.Root.get_focus].
 */
public interface RootIF{
	/** Get the main Gtk struct */
	public GtkRoot* getRootStruct(bool transferOwnership = false);

	/** the main Gtk struct as a void* */
	protected void* getStruct();


	/** */
	public static GType getType()
	{
		return gtk_root_get_type();
	}

	/**
	 * Returns the display that this `GtkRoot` is on.
	 *
	 * Returns: the display of @root
	 */
	public Display getDisplayRoot();

	/**
	 * Retrieves the current focused widget within the root.
	 *
	 * Note that this is the widget that would have the focus
	 * if the root is active; if the root is not focused then
	 * `gtk_widget_has_focus (widget)` will be %FALSE for the
	 * widget.
	 *
	 * Returns: the currently focused widget
	 */
	public Widget getFocus();

	/**
	 * If @focus is not the current focus widget, and is focusable, sets
	 * it as the focus widget for the root.
	 *
	 * If @focus is %NULL, unsets the focus widget for the root.
	 *
	 * To set the focus to a particular widget in the root, it is usually
	 * more convenient to use [method@Gtk.Widget.grab_focus] instead of
	 * this function.
	 *
	 * Params:
	 *     focus = widget to be the new focus widget, or %NULL
	 *         to unset the focus widget
	 */
	public void setFocus(Widget focus);
}
