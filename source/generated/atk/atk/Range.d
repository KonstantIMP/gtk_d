module atk.Range;

private import atk.c.functions;
public  import atk.c.types;
private import glib.ConstructionException;
private import glib.Str;
private import glib.c.functions;
private import gobject.ObjectG;
private import linker.loader;


/**
 * #AtkRange are used on #AtkValue, in order to represent the full
 * range of a given component (for example an slider or a range
 * control), or to define each individual subrange this full range is
 * splitted if available. See #AtkValue documentation for further
 * details.
 */
public class Range
{
	/** the main Gtk struct */
	protected AtkRange* atkRange;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public AtkRange* getRangeStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return atkRange;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)atkRange;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (AtkRange* atkRange, bool ownedRef = false)
	{
		this.atkRange = atkRange;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_ATK[0]) && ownedRef )
			atk_range_free(atkRange);
	}


	/** */
	public static GType getType()
	{
		return atk_range_get_type();
	}

	/**
	 * Creates a new #AtkRange.
	 *
	 * Params:
	 *     lowerLimit = inferior limit for this range
	 *     upperLimit = superior limit for this range
	 *     description = human readable description of this range.
	 *
	 * Returns: a new #AtkRange
	 *
	 * Since: 2.12
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(double lowerLimit, double upperLimit, string description)
	{
		auto __p = atk_range_new(lowerLimit, upperLimit, Str.toStringz(description));

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(AtkRange*) __p);
	}

	/**
	 * Returns a new #AtkRange that is a exact copy of @src
	 *
	 * Returns: a new #AtkRange copy of @src
	 *
	 * Since: 2.12
	 */
	public Range copy()
	{
		auto __p = atk_range_copy(atkRange);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Range)(cast(AtkRange*) __p, true);
	}

	/**
	 * Free @range
	 *
	 * Since: 2.12
	 */
	public void free()
	{
		atk_range_free(atkRange);
		ownedRef = false;
	}

	/**
	 * Returns the human readable description of @range
	 *
	 * Returns: the human-readable description of @range
	 *
	 * Since: 2.12
	 */
	public string getDescription()
	{
		return Str.toString(atk_range_get_description(atkRange));
	}

	/**
	 * Returns the lower limit of @range
	 *
	 * Returns: the lower limit of @range
	 *
	 * Since: 2.12
	 */
	public double getLowerLimit()
	{
		return atk_range_get_lower_limit(atkRange);
	}

	/**
	 * Returns the upper limit of @range
	 *
	 * Returns: the upper limit of @range
	 *
	 * Since: 2.12
	 */
	public double getUpperLimit()
	{
		return atk_range_get_upper_limit(atkRange);
	}
}