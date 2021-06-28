module adw.CarouselIndicatorLines;

private import adw.Carousel;
private import adw.c.functions;
public  import adw.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtk.AccessibleIF;
private import gtk.AccessibleT;
private import gtk.BuildableIF;
private import gtk.BuildableT;
private import gtk.ConstraintTargetIF;
private import gtk.ConstraintTargetT;
private import gtk.OrientableIF;
private import gtk.OrientableT;
private import gtk.Widget;


/**
 * A lines indicator for [class@Adw.Carousel].
 * 
 * The `AdwCarouselIndicatorLines` widget shows a set of lines for each page of
 * a given [class@Adw.Carousel]. The carousel's active page is shown as another
 * line that moves between them to match the carousel's position.
 * 
 * See also [class@Adw.CarouselIndicatorDots].
 * 
 * ## CSS nodes
 * 
 * `AdwCarouselIndicatorLines` has a single CSS node with name
 * `carouselindicatorlines`.
 *
 * Since: 1.0
 */
public class CarouselIndicatorLines : Widget, OrientableIF
{
	/** the main Gtk struct */
	protected AdwCarouselIndicatorLines* adwCarouselIndicatorLines;

	/** Get the main Gtk struct */
	public AdwCarouselIndicatorLines* getCarouselIndicatorLinesStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return adwCarouselIndicatorLines;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)adwCarouselIndicatorLines;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (AdwCarouselIndicatorLines* adwCarouselIndicatorLines, bool ownedRef = false)
	{
		this.adwCarouselIndicatorLines = adwCarouselIndicatorLines;
		super(cast(GtkWidget*)adwCarouselIndicatorLines, ownedRef);
	}

	// add the Orientable capabilities
	mixin OrientableT!(AdwCarouselIndicatorLines);


	/** */
	public static GType getType()
	{
		return adw_carousel_indicator_lines_get_type();
	}

	/**
	 * Creates a new `AdwCarouselIndicatorLines`.
	 *
	 * Returns: the newly created `AdwCarouselIndicatorLines`
	 *
	 * Since: 1.0
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = adw_carousel_indicator_lines_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(AdwCarouselIndicatorLines*) __p);
	}

	/**
	 * Gets the displayed carousel.
	 *
	 * Returns: the displayed carousel
	 *
	 * Since: 1.0
	 */
	public Carousel getCarousel()
	{
		auto __p = adw_carousel_indicator_lines_get_carousel(adwCarouselIndicatorLines);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Carousel)(cast(AdwCarousel*) __p);
	}

	/**
	 * Sets the displayed carousel.
	 *
	 * Params:
	 *     carousel = a carousel
	 *
	 * Since: 1.0
	 */
	public void setCarousel(Carousel carousel)
	{
		adw_carousel_indicator_lines_set_carousel(adwCarouselIndicatorLines, (carousel is null) ? null : carousel.getCarouselStruct());
	}
}
