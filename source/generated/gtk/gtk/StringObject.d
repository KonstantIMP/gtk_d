module gtk.StringObject;

private import glib.ConstructionException;
private import glib.Str;
private import glib.c.functions;
private import gobject.ObjectG;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * `GtkStringObject` is the type of items in a `GtkStringList`.
 * 
 * A `GtkStringObject` is a wrapper around a `const char*`; it has
 * a [property@Gtk.StringObject:string] property.
 */
public class StringObject : ObjectG
{
	/** the main Gtk struct */
	protected GtkStringObject* gtkStringObject;

	/** Get the main Gtk struct */
	public GtkStringObject* getStringObjectStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkStringObject;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkStringObject;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkStringObject* gtkStringObject, bool ownedRef = false)
	{
		this.gtkStringObject = gtkStringObject;
		super(cast(GObject*)gtkStringObject, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_string_object_get_type();
	}

	/**
	 * Wraps a string in an object for use with `GListModel`.
	 *
	 * Params:
	 *     string_ = The string to wrap
	 *
	 * Returns: a new `GtkStringObject`
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(string string_)
	{
		auto __p = gtk_string_object_new(Str.toStringz(string_));

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkStringObject*) __p, true);
	}

	/**
	 * Returns the string contained in a `GtkStringObject`.
	 *
	 * Returns: the string of @self
	 */
	public string getString()
	{
		return Str.toString(gtk_string_object_get_string(gtkStringObject));
	}
}
