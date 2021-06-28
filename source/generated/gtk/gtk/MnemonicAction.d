module gtk.MnemonicAction;

private import gobject.ObjectG;
private import gtk.ShortcutAction;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * A `GtkShortcutAction` that calls gtk_widget_mnemonic_activate().
 */
public class MnemonicAction : ShortcutAction
{
	/** the main Gtk struct */
	protected GtkMnemonicAction* gtkMnemonicAction;

	/** Get the main Gtk struct */
	public GtkMnemonicAction* getMnemonicActionStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkMnemonicAction;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkMnemonicAction;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkMnemonicAction* gtkMnemonicAction, bool ownedRef = false)
	{
		this.gtkMnemonicAction = gtkMnemonicAction;
		super(cast(GtkShortcutAction*)gtkMnemonicAction, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_mnemonic_action_get_type();
	}

	/**
	 * Gets the mnemonic action.
	 *
	 * This is an action that calls gtk_widget_mnemonic_activate()
	 * on the given widget upon activation.
	 *
	 * Returns: The mnemonic action
	 */
	public static MnemonicAction get()
	{
		auto __p = gtk_mnemonic_action_get();

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(MnemonicAction)(cast(GtkMnemonicAction*) __p);
	}
}
