module gtk.ShortcutManagerT;

public  import gtk.c.functions;
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
public template ShortcutManagerT(TStruct)
{
	/** Get the main Gtk struct */
	public GtkShortcutManager* getShortcutManagerStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return cast(GtkShortcutManager*)getStruct();
	}

}
