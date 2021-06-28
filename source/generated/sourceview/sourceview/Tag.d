module sourceview.Tag;

private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;
private import gtk.TextTag;
private import sourceview.c.functions;
public  import sourceview.c.types;


/** */
public class Tag : TextTag
{
	/** the main Gtk struct */
	protected GtkSourceTag* gtkSourceTag;

	/** Get the main Gtk struct */
	public GtkSourceTag* getTagStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkSourceTag;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkSourceTag;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkSourceTag* gtkSourceTag, bool ownedRef = false)
	{
		this.gtkSourceTag = gtkSourceTag;
		super(cast(GtkTextTag*)gtkSourceTag, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_source_tag_get_type();
	}

	/**
	 * Creates a #GtkSourceTag. Configure the tag using object arguments,
	 * i.e. using g_object_set().
	 *
	 * For usual cases, gtk_source_buffer_create_source_tag() is more convenient to
	 * use.
	 *
	 * Params:
	 *     name = tag name, or %NULL.
	 *
	 * Returns: a new #GtkSourceTag.
	 *
	 * Since: 3.20
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(string name)
	{
		auto __p = gtk_source_tag_new(Str.toStringz(name));

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkSourceTag*) __p, true);
	}
}
