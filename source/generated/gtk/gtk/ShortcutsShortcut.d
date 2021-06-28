module gtk.ShortcutsShortcut;

private import gtk.Widget;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * A `GtkShortcutsShortcut` represents a single keyboard shortcut or gesture
 * with a short text.
 * 
 * This widget is only meant to be used with `GtkShortcutsWindow`.
 */
public class ShortcutsShortcut : Widget
{
	/** the main Gtk struct */
	protected GtkShortcutsShortcut* gtkShortcutsShortcut;

	/** Get the main Gtk struct */
	public GtkShortcutsShortcut* getShortcutsShortcutStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkShortcutsShortcut;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkShortcutsShortcut;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkShortcutsShortcut* gtkShortcutsShortcut, bool ownedRef = false)
	{
		this.gtkShortcutsShortcut = gtkShortcutsShortcut;
		super(cast(GtkWidget*)gtkShortcutsShortcut, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_shortcuts_shortcut_get_type();
	}
}
