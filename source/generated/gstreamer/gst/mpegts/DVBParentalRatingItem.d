module gst.mpegts.DVBParentalRatingItem;

private import glib.MemorySlice;
private import glib.Str;
private import glib.c.functions;
private import gst.mpegts.c.functions;
public  import gst.mpegts.c.types;
private import linker.loader;


/** */
public final class DVBParentalRatingItem
{
	/** the main Gtk struct */
	protected GstMpegtsDVBParentalRatingItem* gstMpegtsDVBParentalRatingItem;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstMpegtsDVBParentalRatingItem* getDVBParentalRatingItemStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstMpegtsDVBParentalRatingItem;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstMpegtsDVBParentalRatingItem;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstMpegtsDVBParentalRatingItem* gstMpegtsDVBParentalRatingItem, bool ownedRef = false)
	{
		this.gstMpegtsDVBParentalRatingItem = gstMpegtsDVBParentalRatingItem;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GSTMPEGTS[0]) && ownedRef )
			sliceFree(gstMpegtsDVBParentalRatingItem);
	}


	/** */
	public @property string countryCode()
	{
		return Str.toString(gstMpegtsDVBParentalRatingItem.countryCode);
	}

	/** Ditto */
	public @property void countryCode(string value)
	{
		gstMpegtsDVBParentalRatingItem.countryCode = Str.toStringz(value);
	}

	/** */
	public @property ubyte rating()
	{
		return gstMpegtsDVBParentalRatingItem.rating;
	}

	/** Ditto */
	public @property void rating(ubyte value)
	{
		gstMpegtsDVBParentalRatingItem.rating = value;
	}

	/** */
	public static GType getType()
	{
		return gst_mpegts_dvb_parental_rating_item_get_type();
	}
}
