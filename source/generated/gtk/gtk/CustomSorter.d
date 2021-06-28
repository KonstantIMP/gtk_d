module gtk.CustomSorter;

private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtk.Sorter;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * `GtkCustomSorter` is a `GtkSorter` implementation that sorts via a callback
 * function.
 */
public class CustomSorter : Sorter
{
	/** the main Gtk struct */
	protected GtkCustomSorter* gtkCustomSorter;

	/** Get the main Gtk struct */
	public GtkCustomSorter* getCustomSorterStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkCustomSorter;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkCustomSorter;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkCustomSorter* gtkCustomSorter, bool ownedRef = false)
	{
		this.gtkCustomSorter = gtkCustomSorter;
		super(cast(GtkSorter*)gtkCustomSorter, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_custom_sorter_get_type();
	}

	/**
	 * Creates a new `GtkSorter` that works by calling
	 * @sort_func to compare items.
	 *
	 * If @sort_func is %NULL, all items are considered equal.
	 *
	 * Params:
	 *     sortFunc = the `GCompareDataFunc` to use for sorting
	 *     userData = user data to pass to @sort_func
	 *     userDestroy = destroy notify for @user_data
	 *
	 * Returns: a new `GtkCustomSorter`
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(GCompareDataFunc sortFunc, void* userData, GDestroyNotify userDestroy)
	{
		auto __p = gtk_custom_sorter_new(sortFunc, userData, userDestroy);

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkCustomSorter*) __p, true);
	}

	/**
	 * Sets (or unsets) the function used for sorting items.
	 *
	 * If @sort_func is %NULL, all items are considered equal.
	 *
	 * If the sort func changes its sorting behavior,
	 * gtk_sorter_changed() needs to be called.
	 *
	 * If a previous function was set, its @user_destroy will be
	 * called now.
	 *
	 * Params:
	 *     sortFunc = function to sort items
	 *     userData = user data to pass to @match_func
	 *     userDestroy = destroy notify for @user_data
	 */
	public void setSortFunc(GCompareDataFunc sortFunc, void* userData, GDestroyNotify userDestroy)
	{
		gtk_custom_sorter_set_sort_func(gtkCustomSorter, sortFunc, userData, userDestroy);
	}
}
