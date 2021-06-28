module pango.PgAttributeSize;

private import glib.ConstructionException;
private import pango.PgAttribute;
private import pango.c.functions;
public  import pango.c.types;


/**
 * The `PangoAttrSize` structure is used to represent attributes which
 * set font size.
 */
public class PgAttributeSize : PgAttribute
{
	/** the main Gtk struct */
	protected PangoAttrSize* pangoAttrSize;

	/** Get the main Gtk struct */
	public PangoAttrSize* getPgAttributeSizeStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return pangoAttrSize;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)pangoAttrSize;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (PangoAttrSize* pangoAttrSize, bool ownedRef = false)
	{
		this.pangoAttrSize = pangoAttrSize;
		super(cast(PangoAttribute*)pangoAttrSize, ownedRef);
	}

	/**
	 * Create a new font-size attribute in fractional points.
	 *
	 * Params:
	 *     size = the font size, in %PANGO_SCALE<!-- -->ths of a point.
	 *     absolute = true if the size represents an absolute size.
	 *
	 * Return: the newly allocated #PangoAttribute,
	 *     which should be freed with pango_attribute_destroy().
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(int size, bool absolute) {
		PangoAttribute* p;

		if ( absolute )
			p = pango_attr_size_new_absolute(size);
		else
			p = pango_attr_size_new(size);

		if(p is null) {
			throw new ConstructionException("null returned by new");
	}

	this(cast(PangoAttrSize*) p);
}

/**
 */
}
