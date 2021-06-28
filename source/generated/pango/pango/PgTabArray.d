module pango.PgTabArray;

private import glib.ConstructionException;
private import gobject.ObjectG;
private import linker.loader;
private import pango.c.functions;
public  import pango.c.types;


/**
 * A `PangoTabArray` contains an array of tab stops.
 * 
 * `PangoTabArray` can be used to set tab stops in a `PangoLayout`.
 * Each tab stop has an alignment and a position.
 */
public class PgTabArray
{
	/** the main Gtk struct */
	protected PangoTabArray* pangoTabArray;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public PangoTabArray* getPgTabArrayStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return pangoTabArray;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)pangoTabArray;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (PangoTabArray* pangoTabArray, bool ownedRef = false)
	{
		this.pangoTabArray = pangoTabArray;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_PANGO[0]) && ownedRef )
			pango_tab_array_free(pangoTabArray);
	}


	/** */
	public static GType getType()
	{
		return pango_tab_array_get_type();
	}

	/**
	 * Creates an array of @initial_size tab stops.
	 *
	 * Tab stops are specified in pixel units if @positions_in_pixels is %TRUE,
	 * otherwise in Pango units. All stops are initially at position 0.
	 *
	 * Params:
	 *     initialSize = Initial number of tab stops to allocate, can be 0
	 *     positionsInPixels = whether positions are in pixel units
	 *
	 * Returns: the newly allocated `PangoTabArray`, which should
	 *     be freed with [method@Pango.TabArray.free].
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(int initialSize, bool positionsInPixels)
	{
		auto __p = pango_tab_array_new(initialSize, positionsInPixels);

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(PangoTabArray*) __p);
	}

	/**
	 * Copies a `PangoTabArray`.
	 *
	 * Returns: the newly allocated `PangoTabArray`, which should
	 *     be freed with [method@Pango.TabArray.free].
	 */
	public PgTabArray copy()
	{
		auto __p = pango_tab_array_copy(pangoTabArray);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(PgTabArray)(cast(PangoTabArray*) __p, true);
	}

	/**
	 * Frees a tab array and associated resources.
	 */
	public void free()
	{
		pango_tab_array_free(pangoTabArray);
		ownedRef = false;
	}

	/**
	 * Returns %TRUE if the tab positions are in pixels,
	 * %FALSE if they are in Pango units.
	 *
	 * Returns: whether positions are in pixels.
	 */
	public bool getPositionsInPixels()
	{
		return pango_tab_array_get_positions_in_pixels(pangoTabArray) != 0;
	}

	/**
	 * Gets the number of tab stops in @tab_array.
	 *
	 * Returns: the number of tab stops in the array.
	 */
	public int getSize()
	{
		return pango_tab_array_get_size(pangoTabArray);
	}

	/**
	 * Gets the alignment and position of a tab stop.
	 *
	 * Params:
	 *     tabIndex = tab stop index
	 *     alignment = location to store alignment, or %NULL
	 *     location = location to store tab position, or %NULL
	 */
	public void getTab(int tabIndex, out PangoTabAlign alignment, out int location)
	{
		pango_tab_array_get_tab(pangoTabArray, tabIndex, &alignment, &location);
	}

	/**
	 * If non-%NULL, @alignments and @locations are filled with allocated
	 * arrays.
	 *
	 * The arrays are of length [method@Pango.TabArray.get_size].
	 * You must free the returned array.
	 *
	 * Params:
	 *     alignments = location to store an array of tab
	 *         stop alignments, or %NULL
	 *     locations = location to store an array
	 *         of tab positions, or %NULL
	 */
	public void getTabs(out PangoTabAlign* alignments, out int[] locations)
	{
		int* outlocations;

		pango_tab_array_get_tabs(pangoTabArray, &alignments, &outlocations);

		locations = outlocations[0 .. getArrayLength(outlocations)];
	}

	/**
	 * Resizes a tab array.
	 *
	 * You must subsequently initialize any tabs
	 * that were added as a result of growing the array.
	 *
	 * Params:
	 *     newSize = new size of the array
	 */
	public void resize(int newSize)
	{
		pango_tab_array_resize(pangoTabArray, newSize);
	}

	/**
	 * Sets the alignment and location of a tab stop.
	 *
	 * @alignment must always be %PANGO_TAB_LEFT in the current
	 * implementation.
	 *
	 * Params:
	 *     tabIndex = the index of a tab stop
	 *     alignment = tab alignment
	 *     location = tab location in Pango units
	 */
	public void setTab(int tabIndex, PangoTabAlign alignment, int location)
	{
		pango_tab_array_set_tab(pangoTabArray, tabIndex, alignment, location);
	}
}
