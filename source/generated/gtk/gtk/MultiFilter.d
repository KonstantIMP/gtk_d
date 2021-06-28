module gtk.MultiFilter;

private import gio.ListModelIF;
private import gio.ListModelT;
private import gtk.BuildableIF;
private import gtk.BuildableT;
private import gtk.Filter;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * `GtkMultiFilter` is the base class for filters that combine multiple filters.
 */
public class MultiFilter : Filter, ListModelIF, BuildableIF
{
	/** the main Gtk struct */
	protected GtkMultiFilter* gtkMultiFilter;

	/** Get the main Gtk struct */
	public GtkMultiFilter* getMultiFilterStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkMultiFilter;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkMultiFilter;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkMultiFilter* gtkMultiFilter, bool ownedRef = false)
	{
		this.gtkMultiFilter = gtkMultiFilter;
		super(cast(GtkFilter*)gtkMultiFilter, ownedRef);
	}

	// add the ListModel capabilities
	mixin ListModelT!(GtkMultiFilter);

	// add the Buildable capabilities
	mixin BuildableT!(GtkMultiFilter);


	/** */
	public static GType getType()
	{
		return gtk_multi_filter_get_type();
	}

	/**
	 * Adds a @filter to @self to use for matching.
	 *
	 * Params:
	 *     filter = A new filter to use
	 */
	public void append(Filter filter)
	{
		gtk_multi_filter_append(gtkMultiFilter, (filter is null) ? null : filter.getFilterStruct());
	}

	/**
	 * Removes the filter at the given @position from the list of filters used
	 * by @self.
	 *
	 * If @position is larger than the number of filters, nothing happens and
	 * the function returns.
	 *
	 * Params:
	 *     position = position of filter to remove
	 */
	public void remove(uint position)
	{
		gtk_multi_filter_remove(gtkMultiFilter, position);
	}
}
