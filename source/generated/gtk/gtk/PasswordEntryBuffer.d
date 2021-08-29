module gtk.PasswordEntryBuffer;

private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtk.EntryBuffer;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * A `GtkEntryBuffer` that locks the underlying memory to prevent it
 * from being swapped to disk.
 * 
 * `GtkPasswordEntry` uses a `GtkPasswordEntryBuffer`.
 *
 * Since: 4.4
 */
public class PasswordEntryBuffer : EntryBuffer
{
	/** the main Gtk struct */
	protected GtkPasswordEntryBuffer* gtkPasswordEntryBuffer;

	/** Get the main Gtk struct */
	public GtkPasswordEntryBuffer* getPasswordEntryBufferStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkPasswordEntryBuffer;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkPasswordEntryBuffer;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkPasswordEntryBuffer* gtkPasswordEntryBuffer, bool ownedRef = false)
	{
		this.gtkPasswordEntryBuffer = gtkPasswordEntryBuffer;
		super(cast(GtkEntryBuffer*)gtkPasswordEntryBuffer, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_password_entry_buffer_get_type();
	}

	/**
	 * Creates a new `GtkEntryBuffer` using secure memory allocations.
	 *
	 * Returns: the newly created instance
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = gtk_password_entry_buffer_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkPasswordEntryBuffer*) __p, true);
	}
}
