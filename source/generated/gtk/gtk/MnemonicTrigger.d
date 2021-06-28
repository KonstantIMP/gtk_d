module gtk.MnemonicTrigger;

private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtk.ShortcutTrigger;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * A `GtkShortcutTrigger` that triggers when a specific mnemonic is pressed.
 * 
 * Mnemonics require a *mnemonic modifier* (typically <kbd>Alt</kbd>) to be
 * pressed together with the mnemonic key.
 */
public class MnemonicTrigger : ShortcutTrigger
{
	/** the main Gtk struct */
	protected GtkMnemonicTrigger* gtkMnemonicTrigger;

	/** Get the main Gtk struct */
	public GtkMnemonicTrigger* getMnemonicTriggerStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkMnemonicTrigger;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkMnemonicTrigger;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkMnemonicTrigger* gtkMnemonicTrigger, bool ownedRef = false)
	{
		this.gtkMnemonicTrigger = gtkMnemonicTrigger;
		super(cast(GtkShortcutTrigger*)gtkMnemonicTrigger, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_mnemonic_trigger_get_type();
	}

	/**
	 * Creates a `GtkShortcutTrigger` that will trigger whenever the key with
	 * the given @keyval is pressed and mnemonics have been activated.
	 *
	 * Mnemonics are activated by calling code when a key event with the right
	 * modifiers is detected.
	 *
	 * Params:
	 *     keyval = The keyval to trigger for
	 *
	 * Returns: A new `GtkShortcutTrigger`
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(uint keyval)
	{
		auto __p = gtk_mnemonic_trigger_new(keyval);

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkMnemonicTrigger*) __p, true);
	}

	/**
	 * Gets the keyval that must be pressed to succeed triggering @self.
	 *
	 * Returns: the keyval
	 */
	public uint getKeyval()
	{
		return gtk_mnemonic_trigger_get_keyval(gtkMnemonicTrigger);
	}
}
