module gst.mpegts.SCTESIT;

private import glib.ConstructionException;
private import glib.MemorySlice;
private import glib.PtrArray;
private import gobject.ObjectG;
private import gst.mpegts.c.functions;
public  import gst.mpegts.c.types;
private import linker.loader;


/** */
public final class SCTESIT
{
	/** the main Gtk struct */
	protected GstMpegtsSCTESIT* gstMpegtsSCTESIT;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstMpegtsSCTESIT* getSCTESITStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstMpegtsSCTESIT;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstMpegtsSCTESIT;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstMpegtsSCTESIT* gstMpegtsSCTESIT, bool ownedRef = false)
	{
		this.gstMpegtsSCTESIT = gstMpegtsSCTESIT;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GSTMPEGTS[0]) && ownedRef )
			sliceFree(gstMpegtsSCTESIT);
	}


	/** */
	public @property bool encryptedPacket()
	{
		return gstMpegtsSCTESIT.encryptedPacket != 0;
	}

	/** Ditto */
	public @property void encryptedPacket(bool value)
	{
		gstMpegtsSCTESIT.encryptedPacket = value;
	}

	/** */
	public @property ubyte encryptionAlgorithm()
	{
		return gstMpegtsSCTESIT.encryptionAlgorithm;
	}

	/** Ditto */
	public @property void encryptionAlgorithm(ubyte value)
	{
		gstMpegtsSCTESIT.encryptionAlgorithm = value;
	}

	/** */
	public @property ulong ptsAdjustment()
	{
		return gstMpegtsSCTESIT.ptsAdjustment;
	}

	/** Ditto */
	public @property void ptsAdjustment(ulong value)
	{
		gstMpegtsSCTESIT.ptsAdjustment = value;
	}

	/** */
	public @property ubyte cwIndex()
	{
		return gstMpegtsSCTESIT.cwIndex;
	}

	/** Ditto */
	public @property void cwIndex(ubyte value)
	{
		gstMpegtsSCTESIT.cwIndex = value;
	}

	/** */
	public @property ushort tier()
	{
		return gstMpegtsSCTESIT.tier;
	}

	/** Ditto */
	public @property void tier(ushort value)
	{
		gstMpegtsSCTESIT.tier = value;
	}

	/** */
	public @property ushort spliceCommandLength()
	{
		return gstMpegtsSCTESIT.spliceCommandLength;
	}

	/** Ditto */
	public @property void spliceCommandLength(ushort value)
	{
		gstMpegtsSCTESIT.spliceCommandLength = value;
	}

	/** */
	public @property GstMpegtsSCTESpliceCommandType spliceCommandType()
	{
		return gstMpegtsSCTESIT.spliceCommandType;
	}

	/** Ditto */
	public @property void spliceCommandType(GstMpegtsSCTESpliceCommandType value)
	{
		gstMpegtsSCTESIT.spliceCommandType = value;
	}

	/** */
	public @property bool spliceTimeSpecified()
	{
		return gstMpegtsSCTESIT.spliceTimeSpecified != 0;
	}

	/** Ditto */
	public @property void spliceTimeSpecified(bool value)
	{
		gstMpegtsSCTESIT.spliceTimeSpecified = value;
	}

	/** */
	public @property ulong spliceTime()
	{
		return gstMpegtsSCTESIT.spliceTime;
	}

	/** Ditto */
	public @property void spliceTime(ulong value)
	{
		gstMpegtsSCTESIT.spliceTime = value;
	}

	/** */
	public @property PtrArray splices()
	{
		return new PtrArray(gstMpegtsSCTESIT.splices, false);
	}

	/** Ditto */
	public @property void splices(PtrArray value)
	{
		gstMpegtsSCTESIT.splices = value.getPtrArrayStruct();
	}

	/** */
	public @property PtrArray descriptors()
	{
		return new PtrArray(gstMpegtsSCTESIT.descriptors, false);
	}

	/** Ditto */
	public @property void descriptors(PtrArray value)
	{
		gstMpegtsSCTESIT.descriptors = value.getPtrArrayStruct();
	}

	/** */
	public static GType getType()
	{
		return gst_mpegts_scte_sit_get_type();
	}

	/**
	 * Allocates and initializes a #GstMpegtsSCTESIT.
	 *
	 * Returns: A newly allocated #GstMpegtsSCTESIT
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = gst_mpegts_scte_sit_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GstMpegtsSCTESIT*) __p);
	}
}
