module gtk.Filter;

private import gobject.ObjectG;
private import gobject.Signals;
private import gtk.c.functions;
public  import gtk.c.types;
private import std.algorithm;


/**
 * A `GtkFilter` object describes the filtering to be performed by a
 * `GtkFilterListModel`.
 * 
 * The model will use the filter to determine if it should include items
 * or not by calling [method@Gtk.Filter.match] for each item and only
 * keeping the ones that the function returns %TRUE for.
 * 
 * Filters may change what items they match through their lifetime. In that
 * case, they will emit the [signal@Gtk.Filter::changed] signal to notify
 * that previous filter results are no longer valid and that items should
 * be checked again via [method@Gtk.Filter.match].
 * 
 * GTK provides various pre-made filter implementations for common filtering
 * operations. These filters often include properties that can be linked to
 * various widgets to easily allow searches.
 * 
 * However, in particular for large lists or complex search methods, it is
 * also possible to subclass `GtkFilter` and provide one's own filter.
 */
public class Filter : ObjectG
{
	/** the main Gtk struct */
	protected GtkFilter* gtkFilter;

	/** Get the main Gtk struct */
	public GtkFilter* getFilterStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkFilter;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkFilter;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkFilter* gtkFilter, bool ownedRef = false)
	{
		this.gtkFilter = gtkFilter;
		super(cast(GObject*)gtkFilter, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_filter_get_type();
	}

	/**
	 * Notifies all users of the filter that it has changed.
	 *
	 * This emits the [signal@Gtk.Filter::changed] signal. Users
	 * of the filter should then check items again via
	 * [method@Gtk.Filter.match].
	 *
	 * Depending on the @change parameter, not all items need to
	 * be changed, but only some. Refer to the [enum@Gtk.FilterChange]
	 * documentation for details.
	 *
	 * This function is intended for implementors of `GtkFilter`
	 * subclasses and should not be called from other functions.
	 *
	 * Params:
	 *     change = How the filter changed
	 */
	public void changed(GtkFilterChange change)
	{
		gtk_filter_changed(gtkFilter, change);
	}

	/**
	 * Gets the known strictness of @filters.
	 *
	 * If the strictness is not known, %GTK_FILTER_MATCH_SOME is returned.
	 *
	 * This value may change after emission of the [signal@Gtk.Filter::changed]
	 * signal.
	 *
	 * This function is meant purely for optimization purposes, filters can
	 * choose to omit implementing it, but `GtkFilterListModel` uses it.
	 *
	 * Returns: the strictness of @self
	 */
	public GtkFilterMatch getStrictness()
	{
		return gtk_filter_get_strictness(gtkFilter);
	}

	/**
	 * Checks if the given @item is matched by the filter or not.
	 *
	 * Params:
	 *     item = The item to check
	 *
	 * Returns: %TRUE if the filter matches the item and a filter model should
	 *     keep it, %FALSE if not.
	 */
	public bool match(ObjectG item)
	{
		return gtk_filter_match(gtkFilter, (item is null) ? null : item.getObjectGStruct()) != 0;
	}

	/**
	 * Emitted whenever the filter changed.
	 *
	 * Users of the filter should then check items again via
	 * [method@Gtk.Filter.match].
	 *
	 * `GtkFilterListModel` handles this signal automatically.
	 *
	 * Depending on the @change parameter, not all items need
	 * to be checked, but only some. Refer to the [enum@Gtk.FilterChange]
	 * documentation for details.
	 *
	 * Params:
	 *     change = how the filter changed
	 */
	gulong addOnChanged(void delegate(GtkFilterChange, Filter) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "changed", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
