module gtk.ShortcutManagerIF;

private import gtk.c.functions;
public  import gtk.c.types;


/**
 * The `GtkShortcutManager` interface is used to implement
 * shortcut scopes.
 * 
 * This is important for [iface@Gtk.Native] widgets that have their
 * own surface, since the event controllers that are used to implement
 * managed and global scopes are limited to the same native.
 * 
 * Examples for widgets implementing `GtkShortcutManager` are
 * [class@Gtk.Window] and [class@Gtk.Popover].
 * 
 * Every widget that implements `GtkShortcutManager` will be used as a
 * %GTK_SHORTCUT_SCOPE_MANAGED.
 */
public interface ShortcutManagerIF{
	/** Get the main Gtk struct */
	public GtkShortcutManager* getShortcutManagerStruct(bool transferOwnership = false);

	/** the main Gtk struct as a void* */
	protected void* getStruct();


	/** */
	public static GType getType()
	{
		return gtk_shortcut_manager_get_type();
	}
}
