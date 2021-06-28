module gtk.EveryFilter;

private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtk.MultiFilter;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * `GtkEveryFilter` matches an item when each of its filters matches.
 * 
 * To add filters to a `GtkEveryFilter`, use [method@Gtk.MultiFilter.append].
 */
public class EveryFilter : MultiFilter
{
	/** the main Gtk struct */
	protected GtkEveryFilter* gtkEveryFilter;

	/** Get the main Gtk struct */
	public GtkEveryFilter* getEveryFilterStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkEveryFilter;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkEveryFilter;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkEveryFilter* gtkEveryFilter, bool ownedRef = false)
	{
		this.gtkEveryFilter = gtkEveryFilter;
		super(cast(GtkMultiFilter*)gtkEveryFilter, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_every_filter_get_type();
	}

	/**
	 * Creates a new empty "every" filter.
	 *
	 * Use [method@Gtk.MultiFilter.append] to add filters to it.
	 *
	 * This filter matches an item if each of the filters added to it
	 * matches the item. In particular, this means that if no filter
	 * has been added to it, the filter matches every item.
	 *
	 * Returns: a new `GtkEveryFilter`
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = gtk_every_filter_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkEveryFilter*) __p, true);
	}
}
